module MediasMaximas
  class Criterio
    attr_reader :formula, :notas_usadas
    def initialize(formula)
      @formula = formula
    end

    def media_para(notas)
      formula = formula_com notas
      eval formula
    end

    def formula_com(notas)
      formula = @formula.clone
      notas.each.with_index do |nota, i|
        n = i + 1
        formula.gsub!("g#{n}", nota.round(2).to_s)
      end
      formula
    end

    def media_max_para(notas)
      formula = formula_para_media_max_com notas
      eval formula
    end

    def formula_para_media_max_com(notas)
      formula = formula_com(notas)
      formula.gsub(/g\d/, "10.0")
    end
  end
end
