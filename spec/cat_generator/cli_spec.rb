require 'spec_helper'

describe CatGenerator::Cli do

  describe '.run' do
    context 'no option is given' do
      it 'opens a cat photo in browser' do
        expect(CatGenerator::Photo).to receive(:open_in_browser)
        CatGenerator::Cli.run
      end
    end

    context 'option is browser' do
      it 'opens a cat photo in browser' do
        expect(CatGenerator::Photo).to receive(:open_in_browser)
        CatGenerator::Cli.run('browser')
      end
    end

    context 'option is file' do
      it 'saves a photo of a cat on Desktop' do
        expect(CatGenerator::Photo).to receive(:write_to_desktop)
        CatGenerator::Cli.run('file')
      end
    end

    context 'option is fact' do
      it 'prints a cat fact' do
        expect(CatGenerator::Fact).to receive(:next)
        CatGenerator::Cli.run('fact')
      end
    end

    context 'option is not recognisable' do
      it 'prints usage' do
        expect { CatGenerator::Cli.run('test') }.to output("Usage: cat_generator [browser|file|fact]\n").to_stderr
      end
    end
  end
end
