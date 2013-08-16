require './lib/medias_maximas.rb'

require 'rubygems'
require 'bundler/setup'
Bundler.setup(:default)

require 'json'

desc "Imprime o máximo de média que você pode ter dado as notas que você já teve"
task :max do
  DATA_PATH = './res/data.json'

  data = JSON.parse File.read(DATA_PATH)
  semestre = Semestre.da_config data
  reporter = AproveitamentoMaximoReporter.new
  reporter.imprimir semestre
end
