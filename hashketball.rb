require 'pry'
# Write your code here!

def game_hash
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black','White'],
      players: {
        'Alan Anderson' => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        'Reggie Evans' => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        'Brook Lopez' => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        'Mason Plumlee' => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        'Jason Terry' => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise','Purple'],
      players: {
        'Jeff Adrien' => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        'Bismak Biyombo' => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        'DeSagna Diop' => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        'Ben Gordon' => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        'Brendan Haywood' => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def player_lookup( player, data_item )
  result = ''
  game_hash.each do |team, data|
    data[:players].each do |player_name, stats|
      if player == player_name
        result = stats[data_item.to_sym]
      end
    end
  end
  result
end

def r_player_lookup( data_item, value )
  result = ''
  game_hash.each do |team, data|
    data[:players].each do |player_name, stats|
      if stats[data_item.to_sym] == value
        result += player_name
      end
    end
  end
  result
end

def num_points_scored( player )
  player_lookup( player, 'points' )
end

def shoe_size( player )
  player_lookup( player, 'shoe' )
end

def team_colors( team_name )
  result = []
  game_hash.each do |team, data|
    if data[:team_name] == team_name
      result = data[:colors]
    end
  end
  result
end

def team_names
  names = []
  game_hash.each do |team, data|
    names << data[:team_name]
  end
  names
end

def player_names( team_name )
  players = []
  game_hash.each do |team, data|
    if data[:team_name] == team_name
      players = data[:players].keys
    end
  end
  players
end

def player_numbers( team_name )
  result = []
  players = player_names( team_name )
  players.each do |player|
    result << player_lookup( player, 'number' )
  end
  result
end

def player_stats( player )
  stats = {}
  game_hash.each do |team, data|
    data[:players].each do |player_name, player_stats|
      if player_name == player
        stats = player_stats
      end
    end
  end
  stats
end

def big_shoe_rebounds
  players = []
  shoe_sizes = []
  biggest_feet = ''
  result = 0
  team_names.each do |team_name|
    players << player_names( team_name )
  end
  players.flatten!
  players.each do |player_name|
    shoe_sizes << shoe_size( player_name )
  end
  biggest_feet = r_player_lookup( 'shoe', shoe_sizes.max )
  result = player_lookup( biggest_feet, 'rebounds' )
  result
end
