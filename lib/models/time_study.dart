class TimeStudy{
  final String? hour,minutes,name,subjects,owner,loading,description,add,asset,uid;
  final DateTime?dateTime;
  TimeStudy({this.hour,this.minutes,this.name,this.subjects,this.owner,this.loading,this.description,this.add,this.dateTime,this.asset,this.uid});
}
//add is state symbolizes you swipe left or right.Swipe right is yes.Swipe left is no
//loading is state symbolizes you watched or not.True is watched.False is not watched