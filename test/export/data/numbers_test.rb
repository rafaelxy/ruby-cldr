# encoding: utf-8

require File.expand_path(File.join(File.dirname(__FILE__) + '/../../test_helper'))

class TestCldrDataNumbers < Test::Unit::TestCase
  test "number symbols :de" do
    expected = {
      :nan               => "NaN",
      :decimal           => ",",
      :plus_sign         => "+",
      :minus_sign        => "-",
      :group             => ".",
      :exponential       => "E",
      :percent_sign      => "%",
      :list              => ";",
      :per_mille         => "‰",
      :infinity          => "∞",
      :superscripting_exponent => "·"
    }
    assert_equal expected, Cldr::Export::Data::Numbers.new('de')[:numbers][:symbols]
  end

  test "number formats :de" do
    expected = {
      :decimal => {
        :number_system => "latn",
        :patterns => {
          :default => "#,##0.###",
          "long" =>
            {
              "1000"            => { "one" => "0 Tausend",      "other" => "0 Tausend" },
              "10000"           => { "one" => "00 Tausend",     "other" => "00 Tausend" },
              "100000"          => { "one" => "000 Tausend",    "other" => "000 Tausend" },
              "1000000"         => { "one" => "0 Million",      "other" => "0 Millionen" },
              "10000000"        => { "one" => "00 Millionen",   "other" => "00 Millionen" },
              "100000000"       => { "one" => "000 Millionen",  "other" => "000 Millionen" },
              "1000000000"      => { "one" => "0 Milliarde",    "other" => "0 Milliarden" },
              "10000000000"     => { "one" => "00 Milliarden",  "other" => "00 Milliarden" },
              "100000000000"    => { "one" => "000 Milliarden", "other" => "000 Milliarden" },
              "1000000000000"   => { "one" => "0 Billion",      "other" => "0 Billionen" },
              "10000000000000"  => { "one" => "00 Billionen",   "other" => "00 Billionen" },
              "100000000000000" => { "one" => "000 Billionen",  "other" => "000 Billionen" }
            },
          "short" =>
            {
              "1000"            => { "one" => "0 Tsd",   "other" => "0 Tsd" },
              "10000"           => { "one" => "00 Tsd",  "other" => "00 Tsd" },
              "100000"          => { "one" => "000 Tsd", "other" => "000 Tsd" },
              "1000000"         => { "one" => "0 Mio",   "other" => "0 Mio" },
              "10000000"        => { "one" => "00 Mio",  "other" => "00 Mio" },
              "100000000"       => { "one" => "000 Mio", "other" => "000 Mio" },
              "1000000000"      => { "one" => "0 Mrd",   "other" => "0 Mrd" },
              "10000000000"     => { "one" => "00 Mrd",  "other" => "00 Mrd" },
              "100000000000"    => { "one" => "000 Mrd", "other" => "000 Mrd" },
              "1000000000000"   => { "one" => "0 Bio",   "other" => "0 Bio" },
              "10000000000000"  => { "one" => "00 Bio",  "other" => "00 Bio" },
              "100000000000000" => { "one" => "000 Bio", "other" => "000 Bio" }
            }
        }
      },
      :scientific => {
        :number_system => "latn",
        :patterns => {
          :default => "#E0"
        }
      },
      :percent => {
        :number_system => "latn",
        :patterns => {
          :default => "#,##0 %"     # includes a non-breaking space (\302\240)
        }
      },
      :currency => {
        :number_system => "latn",
        :patterns => {
          :default => "#,##0.00 ¤", # includes a non-breaking space (\302\240)
        },
        :unit => {
          "one"   => "{0} {1}",
          "other" => "{0} {1}"
        }
      }
    }
    assert_equal expected, Cldr::Export::Data::Numbers.new('de')[:numbers][:formats]
  end

  # Cldr::Export::Data.locales.each do |locale|
  #   test "extract number_symbols for #{locale}" do
  #     assert_nothing_raised do
  #       Cldr::Export::Data::Numbers.new(locale)
  #     end
  #   end
  # end
end