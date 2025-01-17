require 'pry'
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(players_name)
  hash = game_hash
  hash.each do |place, team|
    team.each do |characteristic, info|
      if characteristic == :players
        info.each do |player, stats|
          if player == players_name
              return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  hash = game_hash
  hash.each do |place, team|
    team.each do |characteristic, info|
      if characteristic == :players
        info.each do |player, stats|
          if player == players_name
              return stats[:shoe]
          end
        end
      end
    end
  end
end
  
def team_colors(team_name)
  hash = game_hash
    hash.each do |place, team|
      if team[:team_name] == team_name
        return team[:colors]
      end
    end
end
  
def team_names
  hash = game_hash
  hash.map do |place, team|
    team[:team_name]
  end
end

# takes in an argument of a team name and returns an array of the jersey number's for that team

def player_numbers(name)
  nums = []
  game_hash.each do |place, team|
    if team[:team_name] == name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |info, x|
            nums << x[:number]
          end
        end
      end
    end
  end
  nums
end 

def player_stats(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |info, x|
          if info == players_name
            return x
          end
        end
      end
    end
  end   
end

def big_shoe_rebounds
 # return the number of rebounds associated with the player that has the largest shoe size
  shoe_size = 0
  rebounds = 0
  game_hash.each do |place, team|
    team[:players].each do |player, data|
      if data[:shoe] > shoe_size
        shoe_size = data[:shoe]
        rebounds = data[:rebounds]
      end
    end
  end
 rebounds
end

def most_points_scored
#player who scored the most points
  points = 0
  player_name = ""
  game_hash.each do |place, team|
    team[:players].each do |player, data|
      if data[:points] > points
        points = data[:points]
        player_name = player
      end
    end
  end
 player_name
end

def winning_team
  #find total points of each team 
  points = 0
  winners = ""
  game_hash.each do |place, team|
    team_points = 0 
    team[:players].each do |player, data|
      data[:points] = points
      points += team_points
    end
  end  
end 
  

  
    
    
    