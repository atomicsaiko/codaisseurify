# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# The bang versions (e.g. save!) raise an exception if the record is invalid.
# The non-bang versions don’t: save and update_attributes return false, create
# and update just return the objects.

# Artist
susan_wong     = Artist.create!(name: "Susan Wong")
yiruma         = Artist.create!(name: "Yiruma")
ottmar_liebert = Artist.create!(name: "Ottmar Liebert")

# Songs belonging to Susan Wong
Song.create!(name: "Billie Jean", year: 2012, genre: "Pop", artist: susan_wong)
Song.create!(name: "September", year: 2012, genre: "Pop", artist: susan_wong)
Song.create!(name: "Have You Ever Seen The Rain", year: 2012, genre: "Pop", artist: susan_wong)

# Songs belongs_to to Yiruma
Song.create!(name: "Blind Film", year: 2013, genre: "New Age", artist: yiruma)
Song.create!(name: "Waltz in E minor [For Cello]", year: 2013, genre: "New Age", artist: yiruma)
Song.create!(name: "Piano Quartet No.1 in A-Flat", year: 2013, genre: "New Age", artist: yiruma)

# Songs belongs_to to Ottmar Liebert
Song.create!(name: "Looking West until the Train Disappears (Ode to Maglev)", year: 2006, genre: "New Age", artist: ottmar_liebert)
Song.create!(name: "Out of the Blue", year: 2006, genre: "New Age", artist: ottmar_liebert)
Song.create!(name: "Letting Go (MC)", year: 2006, genre: "New Age", artist: ottmar_liebert)

# Get artist of the first song:
# irb > Song.find(1).artist.name

# Get all the songs for the first artist:
# irb > pp Artist.find(1).songs

# Photos (Don't seed this yet)
# ----------------------------
# photo_susan_wong = Photo.create!(remote_image_url: "https://mvdb2b.com/i/300dpi/EVSA249.jpg", artist: susan_wong)
# photo_yiruma = Photo.create!(remote_image_url: "https://mvdb2b.com/i/300dpi/EVSA249.jpg", artist: yiruma)
# photo_ottmar_liebert = Photo.create!(remote_image_url: "https://images-na.ssl-images-amazon.com/images/I/412o8WOE%2BgL.jpg", artist: ottmar_liebert)
