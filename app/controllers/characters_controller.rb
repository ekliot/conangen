class CharactersController < ApplicationController

  # choose creation type, sources, and custom stuff
  def new
    Rails.logger.debug { params.inspect }

    @sourcebooks = Sourcebook.find_each

    case params[:button]

    when 'lifepath'
      redirect_to lifepath_new_char_path

    when 'random'
      redirect_to   random_new_char_path

    end
  end

  # ===========
  # characters/new/:method

    def lifepath
      Rails.logger.debug { params.inspect }

      @homelands      = Lifepath::Homeland.find_each
      @aspects        = Lifepath::Aspect.find_each
      @castes         = Lifepath::Caste.find_each
      @caste_stories  = Lifepath::CasteStory.find_each
      @archetypes     = Lifepath::Archetype.find_each
      @natures        = Lifepath::Nature.find_each
      @educations     = Lifepath::Education.find_each
      @war_stories    = Lifepath::WarStory.find_each

      render 'layouts/characters/_lifepath'
    end

    def random
      Rails.logger.debug { params }
      # gen a character piece-by-piece
      # save the character
      # redirect to the character sheet
    end

  # ===========

  # save a new character (if logged in)
  def create
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

  def create_homeland
  end

  def create_aspect
  end

  def create_caste
  end

  def create_castestory
  end

  def create_archetype
  end

  def create_nature
  end

  def create_education
  end

  def create_warstory
  end

  def create_lifepath
  end

  # show a character sheet for a given id
  def show
  end

  # show the editing screen for a character (if logged in as owning user)
  def edit
  end

  # show the listing of characters for a logged in user, or an example index and prompt to login/sign-up
  def index
  end

  # deletes a given character by id (if logged in as owning user)
  def delete
  end

  # updates a given character by id (if logged in as owning user)
  def update
  end

  # renders a pdf charsheet for a given character by id (if logged in as owning user)
  def export
  end

end
