LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY INT_HANDLER IS
PORT (INTERRUPT_SIGNAL, RTI_SIGNAL_FROM_ALL_STAGES, INTERRUPT1, CLK, RST : IN STD_LOGIC;
      INT_TO_MEM_STAGE, RESET_FETCHING_AND_STALL_PC : OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE ARCH OF INT_HANDLER IS
SIGNAL D12,D23,D34,D4 : STD_LOGIC;
BEGIN
    RESET_FETCHING_AND_STALL_PC <= INTERRUPT_SIGNAL OR D12 OR D23 OR D34 OR D4 OR RTI_SIGNAL_FROM_ALL_STAGES;
    INT_TO_MEM_STAGE <= D4;

    -- PORT MAP DFF
    DFF1: ENTITY WORK.DFF(BEHAVIOURAL) PORT MAP (INTERRUPT_SIGNAL,RST,CLK,D12);
    DFF2: ENTITY WORK.DFF(BEHAVIOURAL) PORT MAP (D12,RST,CLK,D23);
    DFF3: ENTITY WORK.DFF(BEHAVIOURAL) PORT MAP (D23,RST,CLK,D34);
    DFF4: ENTITY WORK.DFF(BEHAVIOURAL) PORT MAP (D34,RST,CLK,D4);
END ARCHITECTURE;	


