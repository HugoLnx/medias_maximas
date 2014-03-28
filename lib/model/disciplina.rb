module MediasMaximas
  class Disciplina
    attr_reader :nome, :criterio, :creditos, :notas, :arredondacao

    def self.da_config(nome, dados={})
      criterio = Criterio.new(Criterio.build(dados["criterio"]))
      creditos = dados["creditos"].to_f
      notas = dados["notas"]
      arredondacao = dados["arredondacao_final"]

      self.new(nome, criterio, creditos, notas, arredondacao)
    end

    def initialize(nome, criterio, creditos, notas, arredondacao)
      @nome = nome
      @criterio = criterio
      @creditos = creditos
      @notas = notas
      @arredondacao = arredondacao
    end

    def media_max
      criterio.media_max_para @notas
    end

    def media_final
      @arredondacao || criterio.media_para(@notas)
    end
  end
end
