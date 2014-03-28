module MediasMaximas
  module Config
    extend self
    DATA_PATH = './res/data.json'
    CRITERIOS_PATH = './res/criterios.json'

    def ler_como_hash
      JSON.parse File.read(DATA_PATH)
    end

    def ler_criterios_como_hash
      JSON.parse File.read(CRITERIOS_PATH)
    end
  end
end
