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

    ![A tiny image](http://placekitten.com/200/300)

    #{Faker::Lorem.sentence(word_count: (100..200).to_a.sample)}

    ![A big image](http://placekitten.com/2000/3000)

    ## h2: #{Faker::TvShows::TwinPeaks.quote}

    #{Faker::Lorem.sentence(word_count: (100..200).to_a.sample)}

    ## h2: #{Faker::TvShows::TwinPeaks.quote}

    #{Faker::Lorem.sentence(word_count: (100..200).to_a.sample)}

    ### h3: #{Faker::TvShows::TwinPeaks.quote}

    A simple text, with *emphasis at a place* and **bold at another place**. Also, **look, sir, at this amazing quote:**

    > #{Faker::TvShows::TwinPeaks.quote}

    #{Faker::Lorem.sentence(word_count: 100)}

    #### h4: #{Faker::TvShows::TwinPeaks.quote}

    #{Faker::Lorem.sentence(word_count: 100)}

    ##### h5: #{Faker::TvShows::TwinPeaks.quote}

    #{Faker::Lorem.sentence(word_count: 100)}

    ###### h6: #{Faker::TvShows::TwinPeaks.quote}

    #{Faker::Lorem.sentence(word_count: 100)}

    ## h2: #{Faker::TvShows::TwinPeaks.quote}

    #{Faker::Lorem.sentence(word_count: (100..200).to_a.sample)}

    ### Reasons to have unordered lists

    - #{Faker::TvShows::TwinPeaks.quote}
    - #{Faker::TvShows::TwinPeaks.quote}
    - #{Faker::TvShows::TwinPeaks.quote}
    - #{Faker::TvShows::TwinPeaks.quote}
    - #{Faker::TvShows::TwinPeaks.quote}
    - #{Faker::TvShows::TwinPeaks.quote}
    - #{Faker::TvShows::TwinPeaks.quote}

    ### Reasons to have ordered lists

    1. #{Faker::TvShows::TwinPeaks.quote}
    2. #{Faker::TvShows::TwinPeaks.quote}
    3. #{Faker::TvShows::TwinPeaks.quote}
    4. #{Faker::TvShows::TwinPeaks.quote}
    5. #{Faker::TvShows::TwinPeaks.quote}
    6. #{Faker::TvShows::TwinPeaks.quote}
    7. #{Faker::TvShows::TwinPeaks.quote}
  PAGE
  File.open("#{path}/__generated_#{index}.md", 'w') { _1.puts(index_page) }
end
