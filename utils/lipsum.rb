require 'faker'


path = '/Users/admin/Projects/pessoal/tales.dev/content/blog'

(23..55).to_a.sample.times do |index|
  index_page = <<~PAGE
    +++
    title = "#{Faker::TvShows::TwinPeaks.quote.tr('"', '')}"
    description = "#{Faker::Lorem.sentence(word_count: (5..25).to_a.sample)}"
    date = 2021-05-13T09:40:48Z
    +++

    #{Faker::Lorem.sentence(word_count: (100..200).to_a.sample)}

    #{Faker::Lorem.sentence(word_count: (100..200).to_a.sample)}

    #{Faker::Lorem.sentence(word_count: (100..200).to_a.sample)}

    #{Faker::Lorem.sentence(word_count: (100..200).to_a.sample)}
  PAGE
  File.open("#{path}/__generated_#{index}.md", 'w') { _1.puts(index_page) }
end
