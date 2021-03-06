module Polytrix
  describe Configuration do
    subject(:configuration) { Configuration.new }

    describe '.manifest' do
      it 'parses the YAML file and registers the manifest' do
        original_manifest = configuration.manifest
        configuration.manifest = 'spec/fixtures/polytrix.yml'
        new_manifest = configuration.manifest
        expect(original_manifest).to_not eq(new_manifest)
        expect(new_manifest).to(be_an_instance_of(Polytrix::Manifest))
      end
    end
  end
end
