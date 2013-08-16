module MediasMaximas
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
end
