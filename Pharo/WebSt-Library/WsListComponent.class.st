Class {
	#name : #WsListComponent,
	#superclass : #WsMvcComponent,
	#instVars : [
		'listView'
	],
	#category : #'WebSt-Library-List'
}

{ #category : #accessing }
WsListComponent class >> itemComponentClass [

	^self subclassResponsibility
]

{ #category : #accessing }
WsListComponent class >> modelClass [

	^ WsListModel
]

{ #category : #accessing }
WsListComponent class >> viewClass [

	<pharoJsSkip>
	^ WsListView
]

{ #category : #adding }
WsListComponent >> addItem [

	| newItem |
	newItem := self newItemModel.
	model add: newItem.
	^ newItem
]

{ #category : #actions }
WsListComponent >> addItemComponent: itemComponent [

	| item |
	item := self createElement: #li.
	item className: 'list-group-item'.
	item appendChild: itemComponent.
	listView appendChild: item
]

{ #category : #initialization }
WsListComponent >> addItemModels: itemModels [
	model addAll: itemModels 
]

{ #category : #actions }
WsListComponent >> displayItemModel: itemModel [

	| itemComponent |
	itemComponent := self newItemComponent: itemModel.
	self addItemComponent: itemComponent
]

{ #category : #initialization }
WsListComponent >> displayModel [

	model items withIndexDo: [ :item :index |
		self displayItemModel: item ]
]

{ #category : #actions }
WsListComponent >> handleAdd: itemModel at: itemIndex [

	self displayItemModel: itemModel 
]

{ #category : #initialization }
WsListComponent >> initModel [

	super initModel.
	model -@ #addPort => [ : itemModel : itemIndex | self handleAdd: itemModel at: itemIndex].
	self displayModel
]

{ #category : #initialization }
WsListComponent >> initView [

	super initView.
	listView := view querySelector: 'ul'
]

{ #category : #accessing }
WsListComponent >> itemComponentClass [
	^ self class itemComponentClass
]

{ #category : #accessing }
WsListComponent >> itemModelClass [

	^ self itemComponentClass modelClass
]

{ #category : #actions }
WsListComponent >> newItemComponent: itemModel [

	^ self itemComponentClass model: itemModel
]

{ #category : #adding }
WsListComponent >> newItemModel [

	^ self itemModelClass new
]
