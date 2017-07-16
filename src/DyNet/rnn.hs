
module DyNet.RNN (
    state,
    newGraph,
    newGraph',
    startNewSequence,
    startNewSequence',
    set_h,
    set_s,
    addInput,
    addInputPrev,
    rewindOneStep,
    getHead,
    setDropout,
    disableDropout,
    back,
    final_h,
    get_h,
    final_s,
    get_s,
    num_h0_components,
    copy,
    -- RNNBuilder_get_parameter_collection
    createSimpleRNNBuilder,
    addAuxiliaryInput,
    createVanillaLSTMBuilder,
    createCoupledLSTMBuilder,
    createFastSTMBuilder,
    createGRUuilder,
    SimpleRNNBuilder,
    VanillaLSTMBuilder,
    CoupledLSTMBuilder,
    FastLSTMBuilder,
    GRUBuilder,
) where


import DyNet.Core
import DyNet.Vector
import DyNet.Internal.RNN

-- class RNN a where
--     newGraph :: a -> ComputationGraph -> Bool -> IO ()
--     startNewSequence :: a -> [Expression] -> IO ()
--     addInput :: a -> Expression -> IO Expression
-- 
--     newGraph' :: a -> ComputationGraph -> IO ()
--     newGraph' rnn cg = newGraph rnn cg True
-- 
--     startNewSequence' :: a -> IO ()
--     startNewSequence' rnn = startNewSequence rnn []
-- 
-- instance RNN SimpleRNNBuilder where
--     newGraph = simpleRNNNewGraph
--     startNewSequence rnn x = fromList x >>= (\x' -> simpleRNNStartNewSequence rnn x')
--     addInput = simpleRNNAddInput
-- 
-- instance RNN VanillaLSTMBuilder where
--     newGraph = vanillaLSTMNewGraph
--     startNewSequence rnn x = fromList x >>= (\x' -> vanillaLSTMStartNewSequence rnn x')
--     addInput = vanillaLSTMAddInput
--


newGraph' rnn cg = newGraph rnn cg True
startNewSequence' :: RNN r => r -> IO ()
startNewSequence' rnn = fromList ([] :: [Expression]) >>= (\x' -> startNewSequence rnn x')

