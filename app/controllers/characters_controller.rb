class CharactersController < ApplicationController
  def new
  end

  def create
    render 'layouts/characters/_creation'

    # @homeland     = chosen_hl
    # @aspect1      = chosen_asp1
    # @aspect2      = chosen_asp2
    # @caste        = chosen_caste
    # @caste_story  = chosen_cs
    # @archetype    = chosen_arch
    # @nature       = chosen_nat
    # @education    = chosen_edu
    # @war_story    = chosen_ws
    #
    # @lifepath     = new Lifepath::Lifepath( @homeland,  @aspect1,     @aspect2,
    #                                         @caste,     @caste_story, @archetype,
    #                                         @nature,    @education,   @war_story )
    # @talent_set   = new TalentSet( @lifepath.get_talents )
    #
    # @char         = new Character( @lifepath, @talent_set, final_touches )
  end

  def view
  end

  def edit
  end

  def index
  end

  def delete
  end

  def export
  end
end
