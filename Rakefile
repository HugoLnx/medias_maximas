require './lib/medias_maximas.rb'

require 'rubygems'
require 'bundler/setup'
Bundler.setup(:default)

require 'json'

desc "Imprime o máximo de média que você pode ter dado as notas que você já teve"
task :max do
  semestre = MediasMaximas::Semestre.da_config MediasMaximas::Config.ler_como_hash
  reporter = MediasMaximas::AproveitamentoMaximoReporter.new
  reporter.imprimir semestre
end
