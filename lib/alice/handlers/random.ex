defmodule Alice.Handlers.Random do
  use Alice.Router

  # Routes

  route ~r/\bhow( shit)? works\b/,                         :how_shit_works
  route ~r/\bbig ?data\b/,                                 :big_data
  route ~r/\bcocaine\b/,                                   :cocaine
  route ~r/\bdemeter\b/i,                                  :say_demeter_again
  route ~r/\bgrapes\b/i,                                   :fuck_yo_grapes
  route ~r/\bbusted\b/i,                                   :busted
  route ~r/\bdevops\b/i,                                   :devops
  route ~r/\bIT IS DECIDED\!?\b/,                          :it_is_decided
  route ~r/\bmind blown\b/i,                               :mind_blown
  route ~r/\bthe game\b/i,                                 :the_game

  route ~r/mic ?drop|drop( ?the)? ?mic/,                   :mic_drop
  route ~r/\bcach(e|ing) ?bug\??\b/,                       :cache_bug
  route ~r/\bping\b/i,                                     :ping
  route ~r/\b(dis|this)( is)? gon(na)? be? g(u|oo)d\b/,    :dis_gon_b_gud
  route ~r/\b(wub ?(wub)?|dub(step)?|d+rop.*bas(s|e))\b/i, :ddddddrop_the_bass
  route ~r/\b(mad|angry|rage)\b/i,                         :u_mad_bro
  route ~r/\bno+pe+\b/i,                                   :nope_nope_nope
  route ~r/\bgooo+d\b/i,                                   :goooood

  # route ~r/\b(ha(ha)+|lol)\b/i,                            :haha
  route ~r/\bto+t(ally|es)\b/i,                            :toooootally
  route ~r/\boh? (yo)?u so\b/i,                            :oh_you_so

  # One Liners

  def handle(conn, :how_shit_works),    do: "http://i.imgur.com/RwxNVbV.png" |> reply(conn)
  def handle(conn, :big_data),          do: "http://i.imgur.com/U6m4s4o.jpg" |> reply(conn)
  def handle(conn, :cocaine),           do: "http://i.imgur.com/A3QICEQ.gif" |> reply(conn)
  def handle(conn, :say_demeter_again), do: "http://i.imgur.com/Z0jvLNm.jpg" |> reply(conn)
  def handle(conn, :fuck_yo_grapes),    do: "http://i.imgur.com/v4y3BLl.gif" |> reply(conn)
  def handle(conn, :busted),            do: "http://i.imgur.com/MasM57I.png" |> reply(conn)
  def handle(conn, :devops),            do: "http://i.imgur.com/Ujxb5gn.png" |> reply(conn)
  def handle(conn, :it_is_decided),     do: "http://i.imgur.com/80PQSCo.gif" |> reply(conn)
  def handle(conn, :mind_blown),        do: "http://i.imgur.com/lr4KJPQ.gif" |> reply(conn)
  def handle(conn, :the_game),          do: "http://i.imgur.com/Z8awIpt.png" |> chance_reply(0.5)

  # Random Choice

  def handle(conn, :mic_drop) do
    ~w[http://i.imgur.com/MpEqxwM.gif
      http://i.imgur.com/YANYG8d.gif
      http://i.imgur.com/ZxZUyH9.gif
      http://i.imgur.com/9XVQlvS.gif
      http://i.imgur.com/XTWiamq.gif
      http://i.imgur.com/3hkSF89.gif]
    |> random_reply(conn)
  end
  def handle(conn, :cache_bug) do
    ~w[http://i.imgur.com/mus48mo.jpg
      http://i.imgur.com/Mt669js.png
      http://i.imgur.com/OzI9RZq.jpg]
    |> random_reply(conn)
  end
  def handle(conn, :ping) do
    ["PONG!", "Can I help you?", "Yes...I'm still here.", "I'm alive!"]
    |> random_reply(conn)
  end
  def handle(conn, :dis_gon_b_gud) do
    ~w[http://i.imgur.com/j7PKhl1.gif
      http://i.imgur.com/mtHKey3.gif
      http://i.imgur.com/uh5A6.gif
      http://i.imgur.com/o3o1fU3.gif]
    |> random_reply(conn)
  end
  def handle(conn, :ddddddrop_the_bass) do
    ~w[http://s3-ec.buzzfed.com/static/enhanced/webdr03/2013/2/15/9/anigif_enhanced-buzz-27236-1360939858-5.gif
      http://s3-ec.buzzfed.com/static/enhanced/webdr01/2013/2/15/9/anigif_enhanced-buzz-5139-1360939681-14.gif
      http://s3-ec.buzzfed.com/static/enhanced/webdr02/2013/2/15/11/enhanced-buzz-3235-1360947432-2.jpg
      http://i1212.photobucket.com/albums/cc460/bbtlv/dubstep.gif
      http://i.imgur.com/kUtovs7.gif]
    |> random_reply(conn)
  end
  def handle(conn, :u_mad_bro) do
    ~w[http://24.media.tumblr.com/e48acd4c34a62200a81df7259ab31d57/tumblr_n2kygg41US1rzgx44o1_400.gif
      http://i1248.photobucket.com/albums/hh490/Andrea2awesome/internet-memes-y-u-mad-tho.jpg
      http://i.imgur.com/KEh9WOT.png]
    |> random_reply(conn)
  end
  def handle(conn, :nope_nope_nope) do
    ~w[http://i.imgur.com/ZG8Y5XQ.gif
      http://i.imgur.com/yBE4JbR.jpg
      http://i.imgur.com/DgczUtV.png]
    |> random_reply(conn)
  end
  def handle(conn, :goooood) do
    ~w[http://i.imgur.com/1jtr4HM.png
      http://torwars.com/wp-content/uploads/2011/10/darth-sidious.jpg
      http://i.imgur.com/j83QRp7.png
      http://i.imgur.com/rm8NcQC.jpg
      http://i.imgur.com/nmC7Hnb.jpg]
    |> random_reply(conn)
  end

  # More Complex

  def handle(conn, :toooootally) do
    chance_reply 0.2,
                 "http://i.imgur.com/XuTdELg.jpg",
                 "to#{String.duplicate("o", Enum.random(0..9))}tally",
                 conn
  end
  # def handle(conn, name=:haha) do
  #   path = state_path(name, :count)
  #   (get_in(conn, path) || 0)
  #   |> case do
  #     93 ->
  #       "https://s3.amazonaws.com/giphymedia/media/Ic97mPViHEG5O/giphy.gif"
  #       |> reply(put_in(conn, path, 0))
  #       count -> put_in(conn, path, count + 1)
  #   end
  # end
  def handle(conn, :oh_you_so) do
    "oh you so #{Enum.random(~w[special clever crazy silly])}"
    |> reply(conn)
  end

  # defp state_path(name, keys) when is_list(keys) do
  #   [:state, __MODULE__, name] ++ keys
  # end
  # defp state_path(name, key), do: state_path(name, [key])
end
