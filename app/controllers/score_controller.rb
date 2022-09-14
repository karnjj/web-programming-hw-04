class ScoreController < ApplicationController
  def list
    @scores = Score.all
    maxPoint = 0
    @maxCourse = ''
    @sumPoint = 0
    @scores.each do |e|
      @sumPoint += e.point
      if e.point > maxPoint
        maxPoint = e.point
        @maxCourse = e.course
      end
    end
  end

  def edit
    id = params[:id]
    @score = Score.find(id)
  end

  def update
    id = params[:id]
    newScore = params[:newScore]
    score = Score.find(id)
    score.course = newScore[:course]
    score.point = newScore[:point]
    score.save
    redirect_to score_list_url
  end

  def delete
    id = params[:id]
    score = Score.find(id)
    score.destroy
    redirect_to score_list_url
  end
end
