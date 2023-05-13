abstract class NewsStates{}

class NewsInitialState extends NewsStates{}
class NewsBottomNavChangeState extends NewsStates{}

class GetNewsBussinessLoadingState extends NewsStates{}
class GetNewsBussinessSuccessState extends NewsStates{

}
class GetNewsBussinessErrorState extends NewsStates{
  final String error;
  GetNewsBussinessErrorState(this.error);
}

class GetNewsSportsLoadingState extends NewsStates{}
class GetNewsSportsSuccessState extends NewsStates{

}
class GetNewsSportsErrorState extends NewsStates{
  final String error;

  GetNewsSportsErrorState(this.error);

}


class GetNewsScienceLoadingState extends NewsStates{}
class GetNewsScinceSuccessState extends NewsStates{

}
class GetNewsScienceErrorState extends NewsStates{
  final String error;

  GetNewsScienceErrorState(this.error);



}



class GetNewsSearchLoadingState extends NewsStates{}
class GetNewsSearchSuccessState extends NewsStates{

}
class GetNewsSearchErrorState extends NewsStates{
  final String error;

  GetNewsSearchErrorState(this.error);



}

