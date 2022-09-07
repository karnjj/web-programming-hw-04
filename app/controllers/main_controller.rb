class MainController < ApplicationController
  def home
    @nCourses = (1..10).to_a
  end

  def test
    @nCourse = params[:nCourse].to_i
    @course = params[:course]
    @errorMsg = Array.new()
    # Handle Submit
    if @course != nil
      # Handle Error
      @course.each do |idx,value|
        errorField = Array.new()

        if value[:name] === ""
          errorField.push("ชื่อวิชา")
        end

        if value[:score] === ""
          errorField.push("คะแนนที่ได้")
        end

        if errorField.length != 0
          error = "กรุณาใส่ #{errorField.join(', ')} ในบรรทัดที่ #{idx}"
          @errorMsg.push(error)
        end
      end
      # Handle Result
      if @errorMsg.length == 0
        maxName = ''
        maxScore = 0
        sumScore = 0
        @course.each do |idx,value|
          score = value[:score].to_i
          sumScore += score
          if score > maxScore
            maxScore = score
            maxName = value[:name]
          end
        end
        redirect_to main_result_path(:maxName => maxName,:sumScore => sumScore)
      end
    end
  end

  def result
    @maxName = params[:maxName]
    @sumScore = params[:sumScore]
  end
end
