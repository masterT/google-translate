RSpec.describe 'GoogleTranslate CLI', type: :cli do
  let(:command) do
    File.expand_path(
      File.join(File.dirname(__FILE__), '..', 'bin', 'google_translate')
    )
  end

  before :all do
    @translations = fixture_json('translations.json').freeze
    @options = [
      '-t', '-target', '-s', '--source', '-v', '--version', '-h', '--help'
    ]
  end

  context 'with version option' do
    context '-v' do
      it 'returns the version' do
        stdout, stderr = run_command(command, '-v')
        expect(stdout).to eq GoogleTranslate::VERSION
        expect(stderr).to be_empty
      end
    end

    context '--version' do
      it 'returns the version' do
        stdout, stderr = run_command(command, '--version')
        expect(stdout).to eq GoogleTranslate::VERSION
        expect(stderr).to be_empty
      end
    end
  end

  context 'with help option' do
    context '-h' do
      it 'returns a help message' do
        stdout, stderr = run_command(command, '-h')
        expect(stdout).to include(*@options)
        expect(stderr).to be_empty
      end
    end

    context '--help' do
      it 'returns a help message' do
        stdout, stderr = run_command(command, '--help')
        expect(stdout).to include(*@options)
        expect(stderr).to be_empty
      end
    end
  end

  context 'with target option' do
    let(:source_language) { @translations.keys.sample }
    let(:text) { @translations[source_language].keys.sample }
    let(:target_language) { @translations[source_language][text].keys.sample }
    let(:expected_translation) { @translations[source_language][text][target_language] }

    context '-t' do
      it 'returns the translation in language to target language' do
        stdout, stderr = run_command(
          command,
          '-t',
          target_language,
          text
        )

        expect(stdout).to match(/#{expected_translation}/i)
      end

      context 'with source option' do
        context '-s' do
          it 'returns the translation in language to target language' do
            stdout, stderr = run_command(
              command,
              '-t',
              target_language,
              '-s',
              source_language,
              text
            )

            expect(stdout).to match(/#{expected_translation}/i)
            expect(stderr).to be_empty
          end
        end

        context '--source' do
          it 'returns the translation in language to target language' do
            stdout, stderr = run_command(
              command,
              '-t',
              target_language,
              '--source',
              source_language,
              text
            )

            expect(stdout).to match(/#{expected_translation}/i)
            expect(stderr).to be_empty
          end
        end
      end
    end

    context '--target' do
      it 'returns the translation in language to target language' do
        stdout, stderr = run_command(
          command,
          '--target',
          target_language,
          text
        )

        expect(stdout).to match(/#{expected_translation}/i)
        expect(stderr).to be_empty
      end

      context 'with source option' do
        context '-s' do
          it 'returns the translation in language to target language' do
            stdout, stderr = run_command(
              command,
              '--target',
              target_language,
              '-s',
              source_language,
              text
            )

            expect(stdout).to match(/#{expected_translation}/i)
            expect(stderr).to be_empty
          end
        end

        context '--source' do
          it 'returns the translation in language to target language' do
            stdout, stderr = run_command(
              command,
              '--target',
              target_language,
              '--source',
              source_language,
              text
            )

            expect(stdout).to match(/#{expected_translation}/i)
            expect(stderr).to be_empty
          end
        end
      end
    end
  end
end
