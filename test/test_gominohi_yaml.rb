require 'test/unit'
require 'ruboty/gominohi'

class TestGominohiYaml < Test::Unit::TestCase
  setup do
    @yaml = ::Ruboty::Gominohi::YAML.new
  end

  test 'enabele to load yaml file' do
    assert_true(@yaml.data.kind_of?(Hash))
  end
end
