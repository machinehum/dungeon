class TurnOption
  attr_accessor :link_target
  attr_accessor :link_params
  attr_accessor :link_text

  def initialize(link_target: nil, link_params: nil, link_text: nil)
    @link_target = link_target
    @link_params = link_params
    @link_text = link_text
  end

  def to_json
    {
      link_target: link_target,
      link_params: link_params,
      link_text: link_text
    }
  end
end
