class JournalEntriesController < SiteController
  before_filter :signed_in?

  def index
    @journal_entries_today = JournalEntry.where("EXTRACT(MONTH FROM date) = ? and EXTRACT(DAY FROM date) = ?", Time.now.strftime("%m"), Time.now.strftime("%d")).order('date ASC')
    @journal_entries_date = JournalEntry.where("EXTRACT(MONTH FROM date) = ? and EXTRACT(DAY FROM date) = ?", params[:month], params[:day]).order('date ASC')
    
    unless params[:month] && params[:day] 
      @selected_date = Time.now
    else
      @selected_date = DateTime.new(Time.now.year, params[:month].to_i, params[:day].to_i)
    end

  end

  def goto_date
    
    if params[:full_date]
      @full_date = Date.parse(params[:full_date])
      month = @full_date.month
      day = @full_date.day
      redirect_to "/journal/#{month}/#{day}"
    else
      @month = params[:month]
      @day = params[:day]
      redirect_to "/journal/#{@month}/#{@day}"
    end
  end

  def new
    @journal_entry = JournalEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  def create
    @journal_entry = JournalEntry.new(params[:journal_entry])

    respond_to do |format|
      if @journal_entry.save
        format.html { redirect_to journal_entries_path, notice: 'Journal entry was successfully created.' }
        format.json { render json: @journal_entry, status: :created, location: @journal_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @journal_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def signed_in?
    redirect_to new_admin_session_path unless admin_signed_in?
  end
end
