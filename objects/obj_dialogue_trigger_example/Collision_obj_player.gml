/// @description start dialogue

var dialogue = instance_create_layer(0, 0, "Effects", obj_dialogue);
dialogue.portrait_index = [0, 1];
dialogue.dialogue_current = 0;

dialogue.portrait_name = ["The Kid", "Strange Guy"];
dialogue.dialogue_index = [0, 1, 1, 0];
dialogue.dialogue_total = 4;

dialogue.dialogue_text = ["This is the first line of a dialogue by left character.",
"This is a first line of a dialogue by right character.",
"And this is a second line!",
"And this is a very very very very very very very very very very very very very very very very very very very very long text by the kid."
];


instance_destroy();
