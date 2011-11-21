class FortunesController < ApplicationController
  respond_to :html, :atom, :js
  # GET /fortunes

def index
  @fortunes = Fortune.search(params[:search]).order(:source).page(params[:page]).per(4)
  respond_with(@fortunes)
end
  # GET /fortunes/1
  # GET /fortunes/1.xml

def show
  @fortune = Fortune.find(params[:id])
  @comment = Comment.new
  respond_with(@fortune)
end

  # GET /fortunes/new
  # GET /fortunes/new.xml
  def new
    @fortune = Fortune.new
    respond_with(@fortune)
  end

  # GET /fortunes/1/edit
  def edit
    @fortune = Fortune.find(params[:id])
  end

  # POST /fortunes
  # POST /fortunes.xml
  def create
    @fortune = Fortune.new(params[:fortune])
    @fortune.save
    respond_with(@fortune)
  end

  # PUT /fortunes/1
  # PUT /fortunes/1.xml
  def update
    @fortune = Fortune.find(params[:id])
    @fortune.update_attributes(params[:fortune])
    respond_with(@fortune)
  end

  # DELETE /fortunes/1
  # DELETE /fortunes/1.xml
  def destroy
    @fortune = Fortune.find(params[:id])
    @fortune.destroy
    respond_with(@fortune)
  end
end

class Fortune < ActiveRecord::Base
  # atrybut: quotation
  validates :quotation, :presence => true
  # validates_presence_of :quotation
  validates_length_of :quotation, :in => 2..128
   validates_length_of :quotation, :minimum => 2, :maximum => 128
  #validates_uniqueness_of :quotation, :case_sensitive => false

  # atrybut: source
  validates_length_of :source, :in => 4..64, :allow_blank => true
end
