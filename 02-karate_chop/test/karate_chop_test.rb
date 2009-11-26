require 'test/unit'
require 'karate'
require 'benchmark'

class KarateChopTest < Test::Unit::TestCase
  def setup
    @karate = MartialArtist.new
  end

  def test_karate
    time = Benchmark.realtime do
      1_000_000.times do
        assert_equal(-1, @karate.chop(3, []))
        assert_equal(-1, @karate.chop(3, [1]))
        assert_equal(0,  @karate.chop(1, [1]))
        #
        assert_equal(0,  @karate.chop(1, [1, 3, 5]))
        assert_equal(1,  @karate.chop(3, [1, 3, 5]))
        assert_equal(2,  @karate.chop(5, [1, 3, 5]))
        assert_equal(-1, @karate.chop(0, [1, 3, 5]))
        assert_equal(-1, @karate.chop(2, [1, 3, 5]))
        assert_equal(-1, @karate.chop(4, [1, 3, 5]))
        assert_equal(-1, @karate.chop(6, [1, 3, 5]))
        #
        assert_equal(0,  @karate.chop(1, [1, 3, 5, 7]))
        assert_equal(1,  @karate.chop(3, [1, 3, 5, 7]))
        assert_equal(2,  @karate.chop(5, [1, 3, 5, 7]))
        assert_equal(3,  @karate.chop(7, [1, 3, 5, 7]))
        assert_equal(-1, @karate.chop(0, [1, 3, 5, 7]))
        assert_equal(-1, @karate.chop(2, [1, 3, 5, 7]))
        assert_equal(-1, @karate.chop(4, [1, 3, 5, 7]))
        assert_equal(-1, @karate.chop(6, [1, 3, 5, 7]))
        assert_equal(-1, @karate.chop(8, [1, 3, 5, 7]))
      end
    end
    puts time
  end

  def test_karate2
    time = Benchmark.realtime do
      1_000_000.times do
        assert_equal(-1, @karate.chop_1(3, []))
        assert_equal(-1, @karate.chop_1(3, [1]))
        assert_equal(0,  @karate.chop_1(1, [1]))
        #                            
        assert_equal(0,  @karate.chop_1(1, [1, 3, 5]))
        assert_equal(1,  @karate.chop_1(3, [1, 3, 5]))
        assert_equal(2,  @karate.chop_1(5, [1, 3, 5]))
        assert_equal(-1, @karate.chop_1(0, [1, 3, 5]))
        assert_equal(-1, @karate.chop_1(2, [1, 3, 5]))
        assert_equal(-1, @karate.chop_1(4, [1, 3, 5]))
        assert_equal(-1, @karate.chop_1(6, [1, 3, 5]))
        #                            
        assert_equal(0,  @karate.chop_1(1, [1, 3, 5, 7]))
        assert_equal(1,  @karate.chop_1(3, [1, 3, 5, 7]))
        assert_equal(2,  @karate.chop_1(5, [1, 3, 5, 7]))
        assert_equal(3,  @karate.chop_1(7, [1, 3, 5, 7]))
        assert_equal(-1, @karate.chop_1(0, [1, 3, 5, 7]))
        assert_equal(-1, @karate.chop_1(2, [1, 3, 5, 7]))
        assert_equal(-1, @karate.chop_1(4, [1, 3, 5, 7]))
        assert_equal(-1, @karate.chop_1(6, [1, 3, 5, 7]))
        assert_equal(-1, @karate.chop_1(8, [1, 3, 5, 7]))
      end
    end
    puts time
  end

  # def test_karate
  #     assert_equal(-1, @karate.chop_2(3, []))
  #     assert_equal(-1, @karate.chop_2(3, [1]))
  #     assert_equal(0,  @karate.chop_2(1, [1]))
  #     #                             2
  #     assert_equal(0,  @karate.chop_2(1, [1, 3, 5]))
  #     assert_equal(1,  @karate.chop_2(3, [1, 3, 5]))
  #     assert_equal(2,  @karate.chop_2(5, [1, 3, 5]))
  #     assert_equal(-1, @karate.chop_2(0, [1, 3, 5]))
  #     assert_equal(-1, @karate.chop_2(2, [1, 3, 5]))
  #     assert_equal(-1, @karate.chop_2(4, [1, 3, 5]))
  #     assert_equal(-1, @karate.chop_2(6, [1, 3, 5]))
  #     #                             2
  #     assert_equal(0,  @karate.chop_2(1, [1, 3, 5, 7]))
  #     assert_equal(1,  @karate.chop_2(3, [1, 3, 5, 7]))
  #     assert_equal(2,  @karate.chop_2(5, [1, 3, 5, 7]))
  #     assert_equal(3,  @karate.chop_2(7, [1, 3, 5, 7]))
  #     assert_equal(-1, @karate.chop_2(0, [1, 3, 5, 7]))
  #     assert_equal(-1, @karate.chop_2(2, [1, 3, 5, 7]))
  #     assert_equal(-1, @karate.chop_2(4, [1, 3, 5, 7]))
  #     assert_equal(-1, @karate.chop_2(6, [1, 3, 5, 7]))
  #     assert_equal(-1, @karate.chop_2(8, [1, 3, 5, 7]))
  #   end

  # def test_time
  #   ChuckNorris.new.chop(8, [1, 3, 5, 7])
  #   MartialArtist.new.chop_1(8, [1, 3, 5, 7])
  # end
end