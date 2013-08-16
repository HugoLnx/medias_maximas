config = {
  jesus1: {
    criterio: 2,
    creditos: 4,
    notas: [8.0, 10.0],
    arredondacao_final: 9.3
  },

  laboratorio: {
    criterio: 3,
    creditos: 2,
    notas: [5.0, 6.8]
  },

  fisica: {
    criterio: 4,
    creditos: 4,
    notas: [9.2, 9.0, 7.3]
  },

  modelagem: {
    criterio: 8,
    creditos: 2,
    notas: [9.6, 9.6]
  },

  ihc: {
    criterio: 2,
    creditos: 4,
    notas: [7.4, 9.6],
    arredondacao_final: 8.9
  },

  logica: {
    criterio: 4,
    creditos: 4,
    notas: [8.5, 10.0, 9.25],
    arredondacao_final: 9.3
  }
}

class Criterio
  attr_reader :formula, :notas_usadas
  def initialize(formula)
    @formula = formula
  end

  def media_max_para(notas)
    sem_variaveis = calc_media_max_para notas
    eval sem_variaveis
  end

  def calc_media_max_para(notas)
    formula = @formula.clone
    notas.each.with_index do |nota, i|
      n = i + 1
      formula.gsub!("g#{n}", nota.round(2).to_s)
    end
    formula.gsub(/g\d/, "10.0")
  end
end

class Disciplina
  attr_reader :nome, :criterio, :creditos, :notas

  CRITERIOS = {
    2 => %q{(g1 + g2*2.0) / 3.0},
    3 => %q{(g1 + g2) / 2.0},
    4 => %q{(g1 + g2 + g3) / 3.0},
    8 => %q{(g1*2 + g1*3.0) / 5.0}
  }

  def self.da_config(nome, dados={})
    criterio = Criterio.new(CRITERIOS[dados[:criterio]])
    creditos = dados[:creditos].to_f
    notas = dados[:notas]

    self.new(nome, criterio, creditos, notas)
  end

  def initialize(nome, criterio, creditos, notas)
    @nome = nome
    @criterio = criterio
    @creditos = creditos
    @notas = notas
  end

  def media_max
    criterio.media_max_para @notas
  end

  def calc_media_max
    criterio.calc_media_max_para @notas
  end
end

class Semestre
  attr_reader :disciplinas

  def self.da_config(opts={})
    disciplinas = opts.map do |nome, dados|
      Disciplina.da_config(nome, dados)
    end

    self.new(disciplinas)
  end

  def initialize(disciplinas)
    @disciplinas = disciplinas
  end

  def creditos
    @disciplinas.map(&:creditos).inject(:+)
  end

  def cr_maximo
    @disciplinas.map{|d| d.media_max * d.creditos}.inject(:+) / creditos
  end
end

class AproveitamentoMaximoReporter
  def imprimir(semestre)
    semestre.disciplinas.each do |disciplina|
      puts "#{disciplina.nome}: #{disciplina.media_max.round(2)}   =>   #{disciplina.criterio.formula}"
    end

    puts "CR: #{semestre.cr_maximo.round(2)}"
  end
end

semestre = Semestre.da_config config
reporter = AproveitamentoMaximoReporter.new
reporter.imprimir semestre
