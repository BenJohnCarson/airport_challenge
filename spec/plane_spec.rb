require 'plane'

describe Plane do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it { is_expected.to respond_to(:take_off) }
    
    it { is_expected.to respond_to(:landed) }
    
    it { is_expected.to respond_to(:airport) }
    
    subject { described_class.new }
    let(:airport) { double :airport }

    describe '#land' do
        before do
            subject.land(airport)
        end
        
        it 'changes @landed state to true' do
            expect(subject.landed).to eq true
        end
        
        it 'it returns the airport it has landed at' do
            expect(subject.airport).to eq airport    
        end
        
        it 'can\'t land again when already landed' do
            error_message = "Plane already landed"
            expect{subject.land(airport)}.to raise_error error_message
        end
    end
    
    describe '#take_off' do
        before do
            subject.land(airport)
            subject.take_off
        end
        
        it 'sets @landed to false' do
            expect(subject.landed).to eq false
        end
        
        it 'sets current airport to flying' do
            expect(subject.airport).to eq :flying
        end
        
        it 'can\'t take off when already flying' do
            error_message = "Plane already flying"
            expect{subject.take_off}.to raise_error error_message
        end
    end
end