require "cinch/mask"
module Cinch
  class Ban
    # @return [Mask, String]
    attr_reader :mask

    # The user who created the ban. Might be nil on networks that do
    # not strictly follow the RFCs, for example IRCnet in some(?)
    # cases.
    #
    # @return [User, nil] The user who created the ban
    attr_reader :by

    # @return [Time]
    attr_reader :created_at

    # @return [Boolean] whether this is an extended ban (as used by for example Freenode)
    attr_reader :extended

    # @param [String] mask The mask
    # @param [User, nil] by The user who created the ban.
    # @param [Time] at The time at which the ban was created
    def initialize(mask, by, at)
      @by, @created_at = by, at
      if mask =~ /^\$/
        @extended = true
        @mask     = mask
      else
        @extended = false
        @mask = Mask.new(mask)
      end
    end

    # @return [Boolean] true if the ban matches `user`
    # @raise [Exceptions::UnsupportedFeature] Cinch does not support
    #   Freenode's extended bans
    def match(user)
      raise UnsupportedFeature, "extended bans (freenode) are not supported yet" if @extended
      @mask =~ user
    end
    alias_method :=~, :match

    # @return [String]
    def to_s
      @mask.to_s
    end
  end
end
