Pod::Spec.new do |spec|
  spec.name         = 'Genome'
  spec.version      = '4.1'
  spec.license      = 'MIT'
  spec.homepage     = 'https://github.com/briandutton/genome'
  spec.authors      = { 'Logan Wright' => ''}
  spec.summary      = 'A simple, type safe, failure driven mapping library for serializing data to models in Swift'
  spec.source       = { :git => 'https://github.com/briandutton/genome.git', :tag => "#{spec.version}" }
  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.9"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"
  spec.requires_arc = true
  spec.default_subspec = "Default"

  spec.subspec "Default" do |ss|
    ss.source_files = 'Sources/Genome/**/*.{swift}'
    ss.exclude_files = 'Sources/Genome/Genome+Exports.swift'
    ss.dependency 'Genome/Core'
    ss.dependency 'Genome/Foundation'
  end

  spec.subspec "Core" do |ss|
    ss.source_files = 'Sources/Genome/Mapping/**/*.{swift}'
    ss.dependency 'Genome/Packages'
  end

  spec.subspec "Packages" do |ss|
    ss.source_files = "Packages/**/*.{swift}"
    ss.exclude_files = 'Packages/**/Node+Exports.swift', 'Packages/**/Tests/**/*.{swift}', 'Packages/**/Package.swift'
  end

  spec.subspec "Foundation" do |ss|
    ss.source_files = 'Sources/GenomeFoundation/**/*.{swift}'
    ss.exclude_files = 'Sources/GenomeFoundation/GenomeFoundation+Exports.swift'
    ss.dependency 'Genome/Core'
  end

  spec.subspec "CoreData" do |ss|
    ss.source_files = 'Sources/GenomeCoreData/**/*.{swift}'
    ss.exclude_files = 'Sources/GenomeCoreData/GenomeCoreData+Exports.swift'
    ss.dependency 'Genome/Foundation'
    ss.dependency 'Genome/Core'
    ss.frameworks = 'CoreData'
  end
end
