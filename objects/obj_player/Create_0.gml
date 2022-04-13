/// @description Initialize player characteristics

frozen = false; // Sets if the player can move or not
gravity = 0.4 * global.grav; // Sets the player's gravity


//Jump variables
jump_power = 7.5 * global.grav; // Sets how fast the player jumps
double_jump_power = 7 * global.grav; // Sets how fast the player double jumps
have_double_jump = true; // Allow the player to double jump as soon as he spawns
have_mega_jump = false; // Sets player availability to do mega jump from jump refresher

//speed variables
max_horizontal_speed = 3; // Sets horizontal speed cap
current_horizontal_speed = 0; // Current horizontal speed
acceleration_power = 0.15; // Sets horizontal speed increment when player moves while standing
deceleration_power = 0.25; // Sets horizontal speed decrement when player stops moving while standing
hspeed_sign = 0; // horizonal speed sign for current frame

max_crouch_speed = 1.5; // Sets speed when crouching
max_vertical_speed = 9; // Sets maximum vertical speed when falling
vertical_speed_cancel = 0.4; // Sets vertical speed multiplier when player releases jump button

//Slide variables
sliding = false; //Sets crouching state
slide_max = 8; //Sets starting slide speed
slide_current = 0; // Current slide speed
slide_scale = 1; //Current slide direction
slide_new = 1; // Sets when player can do new slide
slide_jump = 6; // Sets when player can do a jump after slide

//Platform
on_platform = false; // Sets if the player is currently standing on a platform


//Sound variables
was_on_block = place_meeting(x, y + global.grav, obj_block) //Checks if the player already on a block (this is needed for landing sound)

crouch_sound_timer = 0;
crouch_sound_delay = 22;
		
step_sound_timer = 0;
step_sound_delay = 12;


//Shoot variables
shot_count = 0; // Sets how many bullets player shot in volley
shot_max = 4; // Sets how many bullets player can shoot in one volley 
shooting = false; //Sets shooting state
shot_timer = 0; //Timer for shooting
shot_delay = 7; //Delay between bullets while shooting
shooting = false; // Sets shooting state

x_scale = 1; // Sets the direction the player is facing (1 is facing right, -1 is facing left)

crouching = false; //Sets crouching state
looking = 0; // Sets if the player is looking up or down ( 1 is looking up, -1 is looking down)


//Sprite variables
legs_sprite = spr_player_legs_idle; //Current legs sprite
legs_index = 0;
legs_speed = 1/5;

body_sprite = spr_player_body_idle; //Current body sprite
body_index = 0;
body_speed = 1/5;

cape_index = 0;
cape_speed = 1/4;

have_wings = false;
wings_index = 0;
wings_speed = 1/7;
				
if(global.autosave)
{
	scr_save_game(true);
	global.autosave = false;
}

var set_mask = scr_player_check_recrouch() ? "normal" : "small";
scr_player_update_mask(set_mask);
