class GuiGenerator

  def self.create_bracket_gui(match_list)
    match_list.each do |match|
      puts "\n\n\n"
      puts "|=============================|"
      puts "|Match number: #{match[:match]}"
      puts "|=============================|"
      print "|#{cell_calculator(match[:player_1_details][:name])}|#{cell_calculator(match[:player_2_details][:name])}|\n"
      puts "|=============================|"
      puts "|Champions                    |"
      puts "|=============================|"
      (0..(match[:player_1_details][:champs].count - 1)).each do |number|
        print "|#{cell_calculator(match[:player_1_details][:champs][number])}|#{cell_calculator(match[:player_2_details][:champs][number])}|\n"
      end
      puts "|=============================|"
      puts "|Bans                         |"
      puts "|=============================|"

      (0..(match[:player_1_details][:champs].count - 1)).each do |number|
        print "|#{cell_calculator(match[:player_1_details][:bans][number])}|#{cell_calculator(match[:player_2_details][:bans][number])}|\n"
      end
      puts "|=============================|"
      puts "\n"
    end
  end


  def self.cell_calculator(name)
    white_space = ((14 - name.length) + name.length)
    cell = name.ljust(white_space)
    cell
  end

end
