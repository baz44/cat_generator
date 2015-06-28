module CatGenerator
  class Cli
    def self.run(option = 'browser')
      case option
      when 'browser'
        CatGenerator::Photo.open_in_browser
      when 'file'
        CatGenerator::Photo.write_to_desktop
      when 'fact'
        puts CatGenerator::Fact.next
      else
        warn 'Usage: cat_generator [browser|file|fact]'
      end
    end
  end
end
