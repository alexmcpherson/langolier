class Langolier
  attr_accessor :image, :file_path

  DEGRADORMATICS = %w(
    add_lines
    blur
    black_threshold
    chop
    unsharp
    darken
  )

  def initialize file_path
    @file_path = file_path
    @image = MiniMagick::Image.open(file_path)
  end

  def degrade
    # add_lines
    # add_lines
    15.times do
      self.send DEGRADORMATICS.sample
    end
    # unsharp
    # unsharp
    image.write  "#{@file_path}-output.jpg"
  end

  def add_lines
    colors = %w(#90f030 #ff0000 #333333 #FFFEEE)

    10.times do
      length = rand 0..(@image['width'] / rand(1..3))
      y_offset = rand 0..@image['height']

      @image.combine_options do |c|
        c.fill colors.sample
        c.draw "line 0,#{y_offset},#{length},#{y_offset}"
      end
    end
  end

  def blur
    @image.radial_blur 1
  end

  def black_threshold
    @image.black_threshold '30%'
  end

  def chop
    @image.chop '100x100+10+10'
  end

  def unsharp
    image.unsharp 0
    image.unsharp 10
  end

  def darken
    colors = %w(#90f030 #ff0000 #333333 #FFFEEE)

    @image.combine_options do |c|
      c.fill colors.sample
      c.tint '95%'
    end
  end
end