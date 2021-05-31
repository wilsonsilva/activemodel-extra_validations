require 'activemodel/extra_validations/presence_of_at_least_one_of'

RSpec.describe ActiveModel::Validations::PresenceOfAtLeastOneOfValidator do
  let(:model) do
    build_model do
      attribute :debit_card, :string
      attribute :credit_card, :string

      validate_presence_of_at_least_one_of :debit_card, :credit_card
    end
  end

  describe '#initialize' do
    context 'when the validator is used with no arguments' do
      it 'raises an argument error' do
        expect do
          build_model do
            validate_presence_of_at_least_one_of
          end
        end.to raise_error(ArgumentError, 'This validator requires at least two arguments.')
      end
    end

    context 'when the validator is used with just 1 argument' do
      it 'raises an argument error' do
        expect do
          build_model do
            validate_presence_of_at_least_one_of :debit_card
          end
        end.to raise_error(ArgumentError, 'This validator requires at least two arguments.')
      end
    end
  end

  describe '#validate' do
    context 'when all attributes are blank and no error message is given' do
      let(:model_instance) do
        model.new(debit_card: nil, credit_card: nil)
      end

      it 'adds errors to all validated attributes' do
        model_instance.valid?

        expect(model_instance.errors.full_messages).to eq([
          'Debit card is missing. At least one of [:debit_card, :credit_card] must be present',
          'Credit card is missing. At least one of [:debit_card, :credit_card] must be present'
        ])
      end
    end

    context 'when all attributes are blank and an error message is given' do
      let(:model) do
        custom_error_message = "can't be missing if the other card is also missing"

        build_model do
          attribute :debit_card, :string
          attribute :credit_card, :string

          validate_presence_of_at_least_one_of :debit_card, :credit_card, message: custom_error_message
        end
      end

      let(:model_instance) do
        model.new(debit_card: nil, credit_card: nil)
      end

      it 'adds errors to all validated attributes using the given message' do
        model_instance.valid?

        expect(model_instance.errors.full_messages).to eq([
          "Debit card can't be missing if the other card is also missing",
          "Credit card can't be missing if the other card is also missing"
        ])
      end
    end

    context 'when at least one of the attributes is present' do
      let(:model_instance) do
        model.new(debit_card: '5322 5127 4333 7812', credit_card: nil)
      end

      it 'does not add errors to the model' do
        expect(model_instance).to be_valid
      end
    end
  end
end
