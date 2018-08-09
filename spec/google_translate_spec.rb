RSpec.describe 'GoogleTranslate' do
  before :all do
    @translations = fixture_json('translations.json').freeze
  end

  it 'has a version number' do
    expect(GoogleTranslate::VERSION).not_to be nil
  end

  describe '#translate' do
    let(:source_language) { @translations.keys.sample }
    let(:text) { @translations[source_language].keys.sample }
    let(:target_language) { @translations[source_language][text].keys.sample }
    let(:expected_translation) { @translations[source_language][text][target_language] }

    context 'with target language' do
      it 'returns the translation in language to target language' do
        translation = GoogleTranslate.translate(
          text,
          {target: target_language}
        )

        expect(translation).to match(/#{expected_translation}/i)
      end

      context 'with source language' do
        it 'returns the translation in language to target language' do
          translation = GoogleTranslate.translate(
            text,
            {source: source_language, target: target_language}
          )

          expect(translation).to match(/#{expected_translation}/i)
        end
      end
    end
  end
end
