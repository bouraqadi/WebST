Class {
	#name : 'WsCounterListComponent',
	#superclass : 'WsListComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-List',
	#package : 'WebST-Examples',
	#tag : 'List'
}

{ #category : 'accessing' }
WsCounterListComponent class >> itemComponentClass [

	^ WsCounterComponent
]

{ #category : 'class initialization' }
WsCounterListComponent class >> tagName [

	^ 'ws-counter-list'
]

{ #category : 'adding' }
WsCounterListComponent >> addCounter: countValue [

	| counter |
	counter := self itemModelClass count: countValue.
	model add: counter.
	^counter
]
