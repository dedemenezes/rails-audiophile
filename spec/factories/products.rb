FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Speaker #{n}" }
    price { (200..1000).to_a.sample }
    description do
      "
      Upgrade your sound system with the all new ZX9 active speaker.\
      It’s a bookshelf speaker system that offers truly wireless connectivity \
      -- creating new possibilities for more pleasing and practical audio setups.
    "
    end
    features do
      "
      Connect via Bluetooth or nearly any wired source. \
      This speaker features optical, digital coaxial, USB Type-B, \
      stereo RCA, and stereo XLR inputs, allowing you to have up to \
      five wired source devices connected for easy switching. \
      Improved bluetooth technology offers near lossless \
      audio quality at up to 328ft (100m).
    "
    end
    association :category
  end
end
