module MediasMaximas
  module Config
    extend self
    DATA_PATH = './res/data.json'

    def ler_como_hash
      JSON.parse File.read(DATA_PATH)
    end
  end
end
