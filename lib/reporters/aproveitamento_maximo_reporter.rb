class AproveitamentoMaximoReporter
  def imprimir(semestre)
    semestre.disciplinas.each do |disciplina|
      puts "#{disciplina.nome}: #{disciplina.media_max.round(2)}   =>   #{disciplina.criterio.formula}"
    end

    puts "CR: #{semestre.cr_maximo.round(2)}"
  end
end
