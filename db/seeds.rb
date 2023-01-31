# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



puts "trash"


Application.destroy_all
Offer.destroy_all
Student.destroy_all
Company.destroy_all


puts "create students and companies"

samy = Student.new(email: "samy@hotmail.fr", password: "password", last_name: "Rjob", first_name: "Samy", school: "Audencia", profile: "Business School", tongues: "Anglais", description: "Je serai un stagiaire studieux et investi ! Prenez moi plsss")
jacy = Student.new(email: "jacy@hotmail.fr", password: "password", last_name: "Cy", first_name: "ja", school: "INSA", profile: "Engineer School", tongues: "Allemand", description: "Je parle allemand, y'a aucune raison que vous me preniez pas")

danone = Company.new(email: "danone@hotmail.fr", password: "password", name: "danone", sector: "Banque/Assurance", description: "leader sur le marché mondial des yaourts,
  notre vocation consiste en le bien être éternel des gens", structure: "PME")
celio = Company.new(email: "celio@hotmail.fr", password: "password", name: "celio", sector: "Ventes", description: "Celio, marque de grande vente de fabrique de vêtements, présente partout en
  Europe !", structure: "Grande société mondiale")

file = File.open(Rails.root.join('db/seeds/images/ey.png'))
danone.photo.attach(io: file, filename: "ey.png", content_type: "image/png")

file = File.open(Rails.root.join('db/seeds/images/celio.png'))
celio.photo.attach(io: file, filename: "celio.png", content_type: "image/png")

puts "create offers"

offer1 = Offer.create!(
  company: danone,
  company_id: danone.id,
  start_date: "2023-03-24",
  duration: 10,
  salary: 800.59,
  town: "Berlin",
  end_activation: "2023-02-23",
  status: "archived",
  function: "Conseiller client",
  description: "Venez découvrir notre appartement de 65m² situé au 1er étage d’un immeuble récent de bon standing.

  Vous serez séduits par sa terrasse très bien exposée et sans vis-à-vis, son emplacement de parking sécurisé ainsi que sa proximité avec la vallée du Cens pour profiter d’agréables balades dans la nature.

  Idéalement situé à seulement 10/15 minutes du centre-ville de Nantes, vous profiterez des nombreux commerces de proximité du quartier tout en profitant d'un emplacement calme et silencieux.
  Le logement
  > literie de bonne qualité ;
  > connexion internet avec fibre ;
  > TV écran plat avec système de son ;
  > cuisine équipée avec notamment micro-ondes, lave-linge, cafetière à dosettes, bouilloire, etc. ;
  > épicerie de base : café, thé, sel, poivre, huile, denrées alimentaires de base, etc. ;
  > salle de bain avec douche, sèche-serviettes, sèche-cheveux, savon et shampoing compris ;
  > table et fer à repasser ;
  > livres ;
  > draps et linge de maison fournis ;
  > Nombreux rangements ;
  > …
  Accès des voyageurs
  > à 3 minutes des commerces de proximité et des transports (arrêt de bus « Américains pour un accès rapide et direct au centre-ville en 10 minutes) ;
  > à 5 minutes à pieds de la Vallée du Cens ;
  > à 10 minutes à pieds d’une station de Bicloo (vélos en libre-service type Vélib’) ;
  > à 15 minutes à pieds de l’université de Nantes.
  Autres remarques
  > clés remises en main propre à votre arrivée ;
  > arrivée à partir de 16h selon disponibilité jusqu'à 20h, une arrivée tardive est possible moyennant un complément de 10€ par heure supplémentaire après 20h ;
  > départ de 8h à 11h ;
  > pas de fête ni soirée ;
  > logement strictement non-fumeur ;
  > animaux interdits.
  Numéro d'enregistrement
  4410900265957"
)





offer2 = Offer.create!(
  company: celio,
  company_id: celio.id,
  function: "Stage directeur",
  start_date: "2023-05-24",
  duration: 12,
  salary: 800,
  town: "Lisbonne",
  end_activation: "2023-02-24",
  status: "archived",
  description: "Nous sommes à 2 pas de Graslin, place emblématique de la ville de NANTES. Face au musée DOBREE, quartier calme, espaces verts...Le logement au 5 ème et dernier étage( ascenseur jusqu'au 4 ème) a été entièrement rénové. Lumineux, exposé Sud, vous profitez de superbes vues sur les toits de Nantes et sur la Loire. Belle chambre indépendante équipée en suite parentale. La cuisine est aménagée et équipée.
  Le logement
  Pour le petit déjeuner vous avez à votre disposition, café et thé.
  Grille pain. Une télévision avec accès à toutes les chaines. WIFI
  Numéro d'enregistrement
  441090005386F"
)





offer3 = Offer.create!(
  company: celio,
  company_id: celio.id,
  function: "stage esclavage",
  start_date: "2024-06-25",
  duration: 11,
  salary: 1500.50,
  town: "Barcelone",
  end_activation: "2024-03-25",
  status: "online",
  description: "itué dans le très résidentiel quartier Guist’hau, à quelques minutes à pieds du centre historique de Nantes, le Clair Obscur est un appartement à la décoration et aux prestations haut de gamme.
  Le logement
  Le temps d'une nuit ... ou de plusieurs, laissez-vous gagner par la volupté de l'espace balnéo, cédez à la tentation d'un moment cocooning devant la cheminée et rêvez dans le lit rond... peut-être à la recherche de la clef des trois mystères du Clair Obscur....
  Lieu glamour, où aménagements, jeux de lumière et ambiance musicale s’allient pour vous offrir un espace hors du temps, le Clair Obscur vous invite non seulement à explorer votre côté clair et romantique mais aussi à céder à la tentation de mettre, pourquoi pas, un peu plus de piment en dévoilant le côté –un tout petit peu, un peu, très – obscur  de vos fantasmes...Vous vous laisserez emporter par la magie de sa scénographie avec son magnifique mur végétalisé, sa tapisserie « drapé velours », son immense suspension graphique et aérienne, son mobilier design, ses origamis… chaque détail y est pensé pour en faire un lieu à la fois original et élégant.
  Vous pourrez profiter de ses nombreux équipements tels qu’une balnéo deux places, un lit rond, une vaste douche à l’italienne,  une cheminée suspendue, une cuisine entièrement équipée, un écran plat, le wifi... Au gré de vos envies, vous créerez votre propre ambiance grâce à une tablette tactile qui vous permettra de varier la couleur et l’intensité des lumières, de choisir des playlists de musique préprogrammées …
  Afin d’agrémenter votre séjour, petit déjeuner, bouteille de champagne (sauf du dimanche au jeudi), soft drinks, café, thé vous sont offerts. Nous proposons également, en option, bouquet de fleurs ou service traiteur, avec deux menus différents -gastronomique ou verrines-.
  Numéro d'enregistrement
  4410900003544"
)





offer4 = Offer.create!(
  company: danone,
  company_id: danone.id,
  function: "balayeur",
  start_date: "2023-06-25",
  duration: 4,
  salary: 500.50,
  town: "Paris",
  end_activation: "2023-03-25",
  status: "online",
  description: "Nous vous accueillons avec plaisir dans ce gîte de charme qui jouit d’un cadre exceptionnel, au bord de la rivière.
  Découvrez un logement douillet et confortable, appréciez la beauté du paysage et profitez de la détente offerte par le SPA.
  Le logement
  Perchés dans votre nid douillet au milieu d’un écrin de verdure, vous apprécierez la tranquillité et la vue sur l’une des plus belles rivières de France !
  Vous serez séduits par le confort de ce gîte à la décoration raffinée mêlant couleurs naturelles, matières douces et souci du détail pour éveiller vos sens… Une ambiance chaleureuse pour passer un séjour ressourçant.

  Nous vous donnons l'accès à notre SPA extérieur... Laissez vous bercer
  par les bruits de la nature et profitez des effets conjugués par la
  chaleur, l’apesante­ur et les jets de ma­ssage.
  Nous conviendrons ensemble du créneau horaire ou celui-ci vous sera
  entièrement dédié.
  Vous disposez égale­ment d’un accès priv­atif aux rives de l’­Erdre. Une
  terrasse et du mobi­lier de jardin sont à votre entière disp­osition pour
  vous détendre et pi­corer votre apéritif dinatoire…

  Le Nid de L’Erdre est situé sur une vaste propriété familiale. L’accès et les aménagements ont été pensé pour préserver l’intimité des locataires. Le logement entièrement meublé et équipé peut accueillir deux adultes et un jeune enfant.

  Nous vous proposons en supplément une prestation massage couple. N'hésitez pas à ma contactez pour en savoir plus et réserver : leniddelerdre fr
  Accès des voyageurs
  Le Nid de l’Erdre est situé à côté de notre maison de famille où nous vivons avec nos 2 enfants.
  Nous avons aménagé l’accès et orienté le gîte de façon à préserver l’intimité de chacun.
  Nous partageons bien entendu les espaces extérieurs, la terrasse et le SPA.
  Autres remarques
  Entrée personnelle
  Parking gratuit voiture et vélo
  Terrasse privative au bord de la rivière
  Wifi
  Sèche-cheveux
  Linge de toilettes fournis (y compris peignoirs)
  Playlist musicale
  Jeux et lectures…
  Télévision connectéeBelle villa à louer en famille , cuisine aménagée chauffage électrique pour 6 personnes max avec 5 lits!"
)






puts "create applications"

Application.create!(
  offer:      offer1,
  student:        samy,
  description: "La lettre de motivation, également appelée lettre de candidature ou lettre d'accompagnement, met en avant les compétences et qualités du candidat nécessaire
  s à la réussite de son projet professionnel.…"
)



Application.create!(
  offer:      offer3,
  student:        samy,
  description: "je suis motivé bordel communauté !!!!!!!"
)

Application.create!(
  offer:      offer2,
  student:        jacy,
  description: "Prenez moi et vous aurez pas de sort"
)

Application.create!(
  offer:      offer4,
  student:        jacy,
  description: "je suis motivé donc prenez-moi et vous aurez pas de sort"
)




puts "that's all"
