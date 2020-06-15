/* Please note: even though it says IMPLEMENT ME, in some cases
   the implementation can be empty. In fact, you may wish to remove
   some of the functions entirely
*/
#include "Football.h"
#include<cmath>

// -------------- Team --------------------

// constructor which sets the team name and the number of goals conceded to zero
Team::Team(const string& name) {
	// IMPLEMENT ME
	this->team_name = name;
	goals_conceded = 0;
}

// increments the number of goals conceded by g
void Team::addGoalsConceded(int g) {
	// IMPLEMENT ME
	goals_conceded += g;
}

Team::~Team() {
	// IMPLEMENT ME
}

// added a getter because goals_conceded is a private member
int Team::getGoalsConceded() const{
	return goals_conceded;
}

// added a getter because team_name is a private member
string Team::getTeamName(){
	return team_name;
}
// -------------- Player ------------------

//~ Player::Player() {
	//~ // see comment in .h
//~ }

// the player constructor sets the name, team, assists to 0 and goals scored to 0
Player::Player(const string& name, Team* t) {
	// IMPLEMENT ME
 	this->name = name;
 	this->t = t;
	assists = 0;
	goals_scored = 0;
}

// don't remove this even if you want to make the destructor pure virtual
Player::~Player() {
	// IMPLEMENT ME
}

// increments the number of goals scored by g
void Player::addGoalsScored(int g) {
	// IMPLEMENT ME
	goals_scored += g;
}

// increments the number of assists by a
void Player::addAssists(int a) {
	// IMPLEMENT ME
	assists += a;
	
}

/* int Player::getScore() const {
 * 	// IMPLEMENT ME
 * }
 */

//~ string Player::print() const {
	//~ // IMPLEMENT ME
	//~ // below are just stub code
	//~ string removeMe = "";
	//~ return removeMe;
//~ }

// -------------- Attacker ------------------

Attacker::Attacker(const string& name, Team* t) : Player(name, t){
	// IMPLEMENT ME
}

Attacker::~Attacker() {
	// IMPLEMENT ME
}

// solves the score of the attacker according to the table given in doc
int Attacker::getScore() const {
	// IMPLEMENT ME
	// below are just stub code
	return (4*goals_scored) + (3*assists);
	
}

string Attacker::print() const{
	// IMPLEMENT ME
	// below are just stub code
	string s = "";
	s += "Attacker: " + name + ", Team: " + t->getTeamName() + "\n";
	s += " Goals scored: " + to_string(goals_scored) + "\n";
	s += " Assists: " + to_string(assists) + "\n";
	s += " Goals conceded: " + to_string(t->getGoalsConceded()) + "\n";
	s += " Score: " + to_string(getScore());
	return s;
}

// -------------- Midfielder ------------------

Midfielder::Midfielder(const string& name, Team* t) : Player(name, t) {
	// IMPLEMENT ME
}

Midfielder::~Midfielder() {
	// IMPLEMENT ME
}

// solves the score of the midfielder according to the table given in doc
int Midfielder::getScore() const {
	// IMPLEMENT ME
	// below are just stub code
	if(t->getGoalsConceded() == 0)
		{
			return (5*goals_scored) + (3*assists) + 1;
		}
	else
		{
			return (5*goals_scored) + (3*assists);
		}
}

string Midfielder::print() const {
	// IMPLEMENT ME
	// below are just stub code
	string s = "";
	s += "Midfielder: " + name + ", Team: " + t->getTeamName() + "\n";
	s += " Goals scored: " + to_string(goals_scored) + "\n";
	s += " Assists: " + to_string(assists) + "\n";
	s += " Goals conceded: " + to_string(t->getGoalsConceded()) + "\n";
	s += " Score: " + to_string(getScore());
	return s;
}

// -------------- Defender ------------------

Defender::Defender(const string& name, Team* t) : Player(name, t){
	// IMPLEMENT ME
	
}

Defender::~Defender() {
	// IMPLEMENT ME
}

// solves the score of the defender according to the table given in doc
int Defender::getScore() const {
	// IMPLEMENT ME
	// below are just stub code
	
	if(t->getGoalsConceded() == 0)
	{
		return (6*goals_scored) + (3*assists) + 4;	
	}
	else 
	{
		return (6*goals_scored) + (3*assists) - (floor(t->getGoalsConceded()/2));
	}
}

string Defender::print() const {
	// IMPLEMENT ME
	// below are just stub code
	string s = "";
	s += "Defender: " + name + ", Team: " + t->getTeamName() + "\n";
	s += " Goals scored: " + to_string(goals_scored) + "\n";
	s += " Assists: " + to_string(assists) + "\n";
	s += " Goals conceded: " + to_string(t->getGoalsConceded()) + "\n";
	s += " Score: " + to_string(getScore());
	return s;
}

// -------------- Goalkeeper ------------------

// constructor for goalkeeper sets shots saved to 0
Goalkeeper::Goalkeeper(const string& name, Team* t) : Player(name, t) {
	// IMPLEMENT ME
	shots_saved = 0;
}

Goalkeeper::~Goalkeeper() {
	// IMPLEMENT ME
}

// increments the number of shots saved by ss
void Goalkeeper::addShotsSaved(int ss) {
	// IMPLEMENT ME
	shots_saved += ss;
}

// solves the score of the goalkeeper according to the table given in doc
int Goalkeeper::getScore() const {
	// IMPLEMENT ME
	// below are just stub code
	if(t->getGoalsConceded() == 0)
		{
			return (6*goals_scored) + (3*assists) + (floor((shots_saved/3)) * 1) + 4;
		}
	else
		{
			return (6*goals_scored) + (3*assists) - (floor((t->getGoalsConceded()/2))) + (floor((shots_saved/3)));
		}
}

string Goalkeeper::print() const {
	// IMPLEMENT ME
	// below are just stub code
	string s = "";
	s += "Goalkeeper: " + name + ", Team: " + t->getTeamName() + "\n";
	s += " Goals scored: " + to_string(goals_scored) + "\n";
	s += " Assists: " + to_string(assists) + "\n";
	s += " Goals conceded: " + to_string(t->getGoalsConceded()) + "\n";
	s += " Shots saved: " + to_string(shots_saved) + "\n";
	s += " Score: " + to_string(getScore());
	return s;
}

// -------------- FantasyTeam ------------------

// the constructor for sets the number of players to 0
FantasyTeam::FantasyTeam() {
	// IMPLEMENT ME
	this->num_players = 0;
}

FantasyTeam::~FantasyTeam() {
	// IMPLEMENT ME
}

// as long as number of players is less than 11 and the player hasn't been added to the team
// then the player is added and function returns true
bool FantasyTeam::addPlayer(Player* p) {
	// IMPLEMENT ME
	// below are just stub code
	if(num_players < 11)
	{
		for(auto &pl : players)
		{
			if(p == pl) return false;
		}
		players[num_players++] = p;
		return true;
	}
	else
	{
		return false;
	}
}

// adds all the scores of the players
// to give a total score for the team
int FantasyTeam::getScore() const {
	// IMPLEMENT ME
	// below are just stub code
	int score_total = 0;
	for(int i=0; i<num_players; i++)
	{
		score_total += players[i]->getScore();
	}
	return score_total;
}
