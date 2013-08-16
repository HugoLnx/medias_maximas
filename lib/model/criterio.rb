module MediasMaximas
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
end
