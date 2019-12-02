module EventHelper
  def generate_stars(score)
    result = []
    if score == 1
      result << '<i class="fas fa-star"></i>'
    end
    result
  end
end
