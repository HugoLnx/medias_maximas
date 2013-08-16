class Disciplina
  attr_reader :nome, :criterio, :creditos, :notas

  CRITERIOS = {
    2 => %q{(g1 + g2*2.0) / 3.0},
    3 => %q{(g1 + g2) / 2.0},
    4 => %q{(g1 + g2 + g3) / 3.0},
    8 => %q{(g1*2 + g1*3.0) / 5.0}
  }

  def self.da_config(nome, dados={})
    criterio = Criterio.new(CRITERIOS[dados["criterio"]])
    creditos = dados["creditos"].to_f
    notas = dados["notas"]

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