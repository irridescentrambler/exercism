require 'minitest/autorun'
require_relative 'house'
require 'pry-byebug'

class HouseTest < Minitest::Test
  def test_verse_one___the_house_that_jack_built
    # skip
    expected = <<~RHYME
      This is the house that Jack built.
    RHYME
    assert_equal expected, House.recite(1, 1)
  end

  def test_verse_two___the_malt_that_lay
    expected = <<~RHYME
      This is the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(2, 2)
  end

  def test_verse_three___the_rat_that_ate
    expected = <<~RHYME
      This is the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(3, 3)
  end

  def test_verse_four___the_cat_that_killed
    expected = <<~RHYME
      This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(4, 4)
  end

  def test_verse_five___the_dog_that_worried
    expected = <<~RHYME
      This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(5, 5)
  end

  def test_verse_six___the_cow_with_the_crumpled_horn
    expected = <<~RHYME
      This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(6, 6)
  end

  def test_verse_seven___the_maiden_all_forlorn
    expected = <<~RHYME
      This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(7, 7)
  end

  def test_verse_eight___the_man_all_tattered_and_torn
    expected = <<~RHYME
      This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(8, 8)
  end

  def test_verse_nine___the_priest_all_shaven_and_shorn
    expected = <<~RHYME
      This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(9, 9)
  end

  def test_verse_10___the_rooster_that_crowed_in_the_morn
    expected = <<~RHYME
      This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(10, 10)
  end

  def test_verse_11___the_farmer_sowing_his_corn
    expected = <<~RHYME
      This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(11, 11)
  end

  def test_verse_12___the_horse_and_the_hound_and_the_horn
    expected = <<~RHYME
      This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(12, 12)
  end

  def test_multiple_verses
    expected = <<~RHYME
      This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(4, 8)
  end

  def test_full_rhyme
    expected = <<~RHYME
      This is the house that Jack built.
      This is the malt that lay in the house that Jack built.
      This is the rat that ate the malt that lay in the house that Jack built.
      This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
      This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    RHYME
    assert_equal expected, House.recite(1, 12)
  end
end
