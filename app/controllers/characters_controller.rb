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

    def random
      Rails.logger.debug { params }
      # gen a character piece-by-piece

      # rolls = [
      #   rand( 20 ) + 1,
      #   rand( 20 ) + 1,
      #   rand( 20 ) + 1,
      #   rand( 20 ) + 1,
      #   rand( 20 ) + 1,
      #   rand( 20 ) + 1,
      #   rand( 20 ) + 1,
      #   rand( 20 ) + 1,
      #   rand( 20 ) + 1
      # ]

      # show the results overview with choice to reorganize rolls

      # redirect to lifepath with the randomly selected lifepath
    end

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

      @pre_homeland    = nil
      @pre_aspect1     = nil
      @pre_aspect2     = nil
      @pre_caste       = nil
      @pre_caste_story = nil
      @pre_archetype   = nil
      @pre_nature      = nil
      @pre_education   = nil
      @pre_war_story   = nil

      render 'characters/new/lifepath'
    end

    def select_lifepath
      Rails.logger.debug request.path_parameters
      Rails.logger.debug request.query_parameters
      Rails.logger.debug request.request_parameters

      @divs_to_change = {}

      case params[:lifepath].downcase
      when 'homeland'
        @homeland = Lifepath::Homeland.find( params[:selection_id] )
        @divs_to_change[:RowTwo] = render_to_string partial: "layouts/characters/lifepath/homeland/row_two", locals: { homeland: @homeland }, formats: [:html]

      when 'aspect1'
        @aspect = Lifepath::Aspect.find( params[:selection_id] )
        # @divs_to_change[]

      when 'aspect2'
        @aspect = Lifepath::Aspect.find( params[:selection_id] )
        # @divs_to_change[]

      when 'caste'
        @caste = Lifepath::Caste.find( params[:selection_id] )
        @divs_to_change[:RowTwo] = render_to_string partial: 'layouts/characters/lifepath/caste/row_two', locals: { caste: @caste, caste_story: nil }

      when 'castestory'
        @caste_story = Lifepath::CasteStory.find( params[:selection_id] )
        @divs_to_change[:RowTwo] = render_to_string partial: 'layouts/characters/lifepath/caste/story/row_two', locals: { caste_story: @caste_story }

      when 'archetype'
        @archetype = Lifepath::Archetype.find( params[:selection_id] )
        @divs_to_change[:RowTwo]   = render_to_string partial: "layouts/characters/lifepath/archetype/row_two",   locals: { archetype: @archetype }, formats: [:html]
        @divs_to_change[:RowThree] = render_to_string partial: "layouts/characters/lifepath/archetype/row_three", locals: { archetype: @archetype }, formats: [:html]
        @divs_to_change[:RowFour]  = render_to_string partial: "layouts/characters/lifepath/archetype/row_four",  locals: { archetype: @archetype }, formats: [:html]

      when 'nature'
        @nature = Lifepath::Nature.find( params[:selection_id] )
        @divs_to_change[:RowTwo]   = render_to_string partial: "layouts/characters/lifepath/nature/row_two",   locals: { nature: @nature }, formats: [:html]
        @divs_to_change[:RowThree] = render_to_string partial: "layouts/characters/lifepath/nature/row_three", locals: { nature: @nature }, formats: [:html]

      when 'education'
        @education = Lifepath::Education.find( params[:selection_id] )
        @divs_to_change[:RowTwo]   = render_to_string partial: "layouts/characters/lifepath/education/row_two",   locals: { education: @education }, formats: [:html]
        @divs_to_change[:RowThree] = render_to_string partial: "layouts/characters/lifepath/education/row_three", locals: { education: @education }, formats: [:html]

      when 'warstory'
        @war_story = Lifepath::WarStory.find( params[:selection_id] )

      end

      respond_to do |format|
        format.json {
          render json: { divs: @divs_to_change }
        }
      end
    end

    def get_char_title
      @title = CharactersHelper.gen_title( params.slice( :name, :archetype, :homeland ), params[:html] )

      respond_to do |format|
        format.json {
          render json: { title: @title }
        }
      end
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
    #
    # redirect to char sheet
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
