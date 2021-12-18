class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @anserData = CpPoint.find_by(evaluated_user_id: params[:id], answerer_id: current_user.id)
    # if !anserData.nil?
    #   @evaluated_user_id = anserData.answerer_id
    # else
    #   @evaluated_user_id = 0
    # end

    @cp_questions = ["何事もきちっとしなければ気が済まない","人が間違ったことをしたときは、なかなか許せない","責任感が強い","自分の考えは譲らず、最後まで通す","礼儀作法の厳しいしつけを受けた","小さな不正でも、うやむやにしない","権利を主張する前に義務を果たす","「…ねばならない」「…すべきだ」という言い方をよくする","規則は守る方で、時間やお金にはルーズなことは嫌いだ","子どもや部下は厳し教育する"]
    @np_questions = ["道を聞かれたら親切に教えてあげる", "相手の話に耳を傾け、共感することがある", "他人の世話をすることが好きだ", "人の悪いところよりも、いいところを見るようにする", "ガッカリしているしている人がいたら、慰めたり元気つけてあげる", "融通が効く方だと思う", "人から何か頼まれたらイヤとは言えない", "誰かが失敗した時、責めないで許してあげる", "社会奉仕的な仕事に参加することが好きだ", "義理と人情を重視する"]
    @a_questions = ["人の意見は賛否両論を聞いて参考にする", "何かうまくいかない時でもあまりカッとならない", "何か決める時、いろんな人の意見を聞いて参考にする", "初めて何かするときは、よく調べてからする", "何かするとき、自分にとって得か損かをよく考える", "何か分からないことがあると、人に聞いたり相談する", "体調不良のときは、自重して無理しないようにする", "両親や友人、上司などと冷静によく話し合うことがある", "能率的にテキパキと仕事を片付ける", "情緒的というよりむしろ論理的だ"]
    @fc_questions = ["おしゃれが好きだ", "みんなと騒いだりはしゃいだりして遊ぶのが好きだ", "言いたいことを遠慮なく言う", "嬉しいときや悲しいときは、表情や動作に表す", "欲しいものは、手に入れないと気が済まない", "異性に自由に話しかけることができる", "人に冗談を言ったりからかったりするのが好きだ", "スポーツやダンス、歌を歌ったりするのが好きだ", "直感で判断することが多い", "好奇心が強い"]
    @ac_questions = ["人の顔色や言うことが気にかかるところがある", "イヤなことをイヤと言えず、、抑えてしまうことが多い", "劣等感が強い", "何かに頼まれると、すぐにやらず引き伸ばす癖がある", "人からよく思われたいと思う", "本当の自分の考えよりも、人の言うことに影響されることがよくある", "悲しみや憂鬱な気持ちになることがよくある", "遠慮がちで、少し消極的になることがある", "思っていることを口に出せない方だ", "「自分らしい自分」「本当の自分とはかけ離れている気がする」"]
    @chart_data = []
    [CpPoint, NpPoint, APoint, FcPoint, AcPoint].each do |model|
      @values = []
      # 各ポイントテーブルのポイント合計を取得してレコードがあれば値をいれる。なければ０を入れる。
      # .group（評価されるユーザーごとに集計したい）

      if model.group(:evaluated_user_id).where(evaluated_user_id: @user.id).select("sum(point) as point").length > 0
        @values = [model.to_s, model.group(:evaluated_user_id).where(evaluated_user_id: @user.id).select("sum(point) as point")[0][:point]]
      else
        @values = [model.to_s, 0]
      end
      @chart_data.push(@values)
    end
    # @chart_dataは["横軸", 縦軸]になっている。
    # @chart_data = [
    #  ["CpPoint", 10],
    #  ["NpPoint", 1],
    #  ["APoint", 15],
    #  ["FcPoint", 13],
    #  ["AcPoint", 12],
    # ]
  end

  def my_page
    @user = current_user
    @chart_data = []
    [CpPoint, NpPoint, APoint, FcPoint, AcPoint].each do |model|
      @values = []
      # 各ポイントテーブルのポイント合計を取得してレコードがあれば値をいれる。なければ０を入れる。
      # .group（評価されるユーザーごとに集計したい）

      if model.group(:evaluated_user_id).where(evaluated_user_id: @user.id).select("sum(point) as point").length > 0
        @values = [model.to_s, model.group(:evaluated_user_id).where(evaluated_user_id: @user.id).select("sum(point) as point")[0][:point]]
      else
        @values = [model.to_s, 0]
      end
      @chart_data.push(@values)
    end
  end

  def edit
    @user = current_user
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to users_my_page_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :age, :gender, :profile_image, :job, :job_details, :annual_income, :hobbies, :hobbies_details)
    end

end