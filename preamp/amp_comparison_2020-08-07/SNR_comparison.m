addpath("/Users/lincolncb/Documents/Projects/LNA_comparison_20200807/")
ph_noise_limits = [5, 30, 221, 250];
fr_noise_limits = [5, 100, 151, 250];
phys_noise_range = [ph_noise_limits(1):ph_noise_limits(2), ph_noise_limits(3):ph_noise_limits(4)];
freq_noise_range = [fr_noise_limits(1):fr_noise_limits(2), fr_noise_limits(3):fr_noise_limits(4)];
noise_colors = ["--r", "--r", "--o", "--o"];

fnames = ["MITEQ_MITEQ_acq003_MH_YZX_Grpos2x_LD1p0_4avg_TEshort_pnav_singleecho.tnt",... 
    "MITEQ_MINI_acq003_MH_YZX_Grpos2x_LD1p0_4avg_TEshort_pnav_singleecho.tnt",...
    "ARR_MINI_MINI_acq003_MH_YZX_Grpos2x_LD1p0_4avg_TEshort_pnav_singleecho.tnt",...
    "PHA_MINI_MINI_acq003_MH_YZX_Grpos2x_LD1p0_4avg_TEshort_pnav_singleecho.tnt",...
    "PHA_PHA_MINI_acq003_MH_YZX_Grpos2x_LD1p0_4avg_TEshort_pnav_singleecho.tnt"];

ftitles = ["Two-stage AU-1583", "AU-1583, ZFL-500LN+", "[ARR model name?], Two-stage ZFL-500LN+",...
    "PHA-13LN+, Two-stage ZFL-500LN+", "Two-stage PHA-13LN+, ZFL-500LN+"];

out_file = ["miteq_miteq", "miteq_booster", "arr_booster_booster",...
    "lna_booster_booster", "lna_lna_booster"];

for i = 1:length(fnames)
    tec_data=Read_Tecmag(fnames(i));
    figure(i)
    sgtitle(strcat(ftitles(i), " (arbitrary units)"))
    subplot(2,1,1);
    phys_data=abs(tec_data);
    plot(phys_data)
    for j = 1:4
        xline(ph_noise_limits(j),noise_colors(j));
    end
    title(sprintf("Physical response -- SNR: ~%0.2e", calc_SNR(phys_data, phys_noise_range)))
    subplot(2,1,2);
    freq_data=abs(ifftshift(fft(tec_data)));
    plot(freq_data)
    for j = 1:4
        xline(fr_noise_limits(j),noise_colors(j));
    end
    title(sprintf("Frequency response -- SNR: ~%0.2e", calc_SNR(freq_data, freq_noise_range)))
    saveas(figure(i), strcat(out_file(i), '.pdf'))
end
