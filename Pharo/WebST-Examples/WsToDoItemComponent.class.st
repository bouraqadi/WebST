Class {
	#name : #WsToDoItemComponent,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'textComponent',
		'checkbox'
	],
	#category : #'WebST-Examples-ToDoList'
}

{ #category : #accessing }
WsToDoItemComponent class >> modelClass [

	^WsToDoItemModel 
]

{ #category : #'class initialization' }
WsToDoItemComponent class >> tagName [

	^ 'ws-todo-item'
]

{ #category : #accessing }
WsToDoItemComponent class >> viewClass [

	<pharoJsSkip>
	^WsToDoItemView 
]

{ #category : #actions }
WsToDoItemComponent >> displayChecked: aBoolean [
	checkbox checked: aBoolean
]

{ #category : #initialization }
WsToDoItemComponent >> initModel [

	super initModel.
	textComponent model: model.
	model -@ #isCheckedPort
	=> [ :isChecked | self displayChecked: isChecked ].
	self displayChecked: model isChecked.

]

{ #category : #initialization }
WsToDoItemComponent >> initView [

	super initView.
	textComponent := view querySelector: WsEditableTextComponent tagName.
	checkbox := view querySelector: '.todo-checkbox'
]

{ #category : #accessing }
WsToDoItemComponent >> textComponent [
	^textComponent 
]
